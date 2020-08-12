# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='gnabel'
pkgver='0.0.0'
pkgrel='3'
pkgdesc='A translation app for GTK environments based on Google Translate'
arch=('any')
depends=(
  'python>=3'
  'python-pyperclip'
  'python-gobject'
  'python-googletrans' # aur only
  'python-gtts' # aur only
  'python-pydub' # aur only
)
url='https://github.com/gi-lom/gnabel'
license=('GPL-3.0')
_git_ref='4559acb895d754ecd985dab686eb1acd7e5f37b4'
source=(
  "https://github.com/gi-lom/gnabel/archive/$_git_ref.zip"
)
sha512sums=('SKIP')

package() {
  cd "gnabel-$_git_ref"

  msg2 'Installing LICENSE'
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg2 'Installing executable'
  install -Dm755 gnabel.py "$pkgdir/usr/bin/gnabel"

  msg2 'Installing desktop file'
  install -Dm755 gnabel.desktop "$pkgdir/usr/share/applications/gnabel.desktop"

  msg2 'Installing icon'
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gnabel.svg"
}
