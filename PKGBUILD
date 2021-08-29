# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=maunium-sticker-picker-git
pkgver=r61.ec8eeee
pkgrel=1
epoch=1
pkgdesc="create or import sticker packs from telegram, to be used at the Maunium sticker picker for Matrix"
arch=("$CARCH")
url="https://github.com/maunium/stickerpicker"
license=('AGPL3')
depends=('python>=3.6' 'python-aiohttp' 'python-yarl' 'python-pillow' 'python-telethon' 'python-cryptg' 'python-magic')
makedepends=('python-setuptools')
provides=("maunium-sticker-picker")
_source_path="stickerpicker"
source=("$_source_path::git+https://github.com/maunium/stickerpicker.git")
sha512sums=('SKIP')

pkgver()
{
  cd "$_source_path"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_source_path"
  python setup.py install --root="$pkgdir" --optimize=1
}
