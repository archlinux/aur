pkgname=google-chinese-handwriting-ime
pkgver=2.1.0
pkgrel=1
pkgdesc="Chinese handwriting IME powered by Google Translate. MacOS style touchpad writing is supported. Written in Electron for Linux."
arch=('x86_64')
url="https://github.com/Saren-Arterius/google-chinese-handwriting-ime"
depends=('xdotool' 'xorg-xinput' 'xorg-xdpyinfo' 'python-pyperclip' 'yarn' 'evtest' 'gconf')
_commit=786f896ec6e9fc81c774eb2615fa35566d158d66 # # tags/v2.1.0 
source=("git+https://github.com/Saren-Arterius/google-chinese-handwriting-ime.git#commit=$_commit" 'google-chinese-handwriting-ime.desktop')
sha256sums=('SKIP' '8aad77fc7e22ec8017243d57c530845b336d65cf321386b1b78e4362f38bbab4')

build() {
  cd "${pkgname}"
  yarn
}

package() {
  mkdir -p "${pkgdir}/opt/"
  cp -r "${pkgname}" "${pkgdir}/opt/${pkgname}"
  rm -r "${pkgdir}/opt/${pkgname}/.git"
  install -Dm644 "google-chinese-handwriting-ime.desktop" "${pkgdir}/usr/share/applications/google-chinese-handwriting-ime.desktop"
}
