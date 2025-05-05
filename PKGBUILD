# Maintainer: 6e6f303216 <dev@wondermakers.space>. Wonders are closer than they seem: https://t.me/wondermakers_space
pkgname=entracte
pkgver=1.0.0
pkgrel=1
pkgdesc="A customizable Pomodoro-based time manager with screen lock and score tracking. Created by 6e6f303216 (Wondermakers)."
arch=('x86_64')
url="https://github.com/6e6f303216/entracte"
license=('MIT')
depends=('glibc' 'qt6-base' 'pulseaudio')
makedepends=('python' 'pyinstaller' 'python-pyqt6' 'python-pyqt6-sip' 'git')
source=("git+$url.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  pyinstaller --noconfirm entracte.spec
}

package() {
  install -Dm755 "$srcdir/$pkgname/dist/entracte" "$pkgdir/usr/bin/entracte"
  install -d "$pkgdir/usr/share/entracte/assets"
  cp -r "$srcdir/$pkgname/assets/"* "$pkgdir/usr/share/entracte/assets/"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
