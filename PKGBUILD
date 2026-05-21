pkgname=jacket-git
pkgver=1.0.0.r3.2b4114d
pkgrel=1
pkgdesc="Voice-activated soundboard"
arch=('x86_64')
url="https://github.com/GoreliSuhar1/JacketVoice"
license=('MIT')
depends=('python' 'python-sounddevice' 'python-vosk' 'python-pydub' 'python-numpy' 'pipewire')
source=("git+https://github.com/GoreliSuhar1/JacketVoice.git")
sha256sums=('SKIP')

pkgver() {
  cd JacketVoice
  printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "$pkgdir/opt/jacket"
  cp -r JacketVoice/* "$pkgdir/opt/jacket/"
  
  install -d "$pkgdir/usr/bin"
  ln -s /opt/jacket/jacket_run.sh "$pkgdir/usr/bin/jacket"
}
