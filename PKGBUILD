# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Joel Pickett <mail at vyryls dot com>

_pkgname=librewolf-extension-istilldontcareaboutcookies
_id=idcac-pub@guus.ninja
pkgname=$_pkgname-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="Debloated fork of the extension I don't care about cookies"
url=https://github.com/OhMyGuus/I-Still-Dont-Care-About-Cookies
arch=('any')
license=('GPL-3.0-only')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("istilldontcareaboutcookies-$pkgver.xpi")
_number=4213061
source=("idcac-pub@guus.ninja.xpi::https://addons.mozilla.org/firefox/downloads/file/$_number/istilldontcareaboutcookies-$pkgver.xpi"
        "https://raw.githubusercontent.com/OhMyGuus/I-Still-Dont-Care-About-Cookies/refs/tags/v$pkgver/LICENSE")
b2sums=('cf2cee8fac38bbcce07671ae6cc03c4a515326f8023ea0b2b0b2977d963eb8446c01db163d91caffc168f54dae253e65b3b8ac90a8d1d045c039f184cedaccc3'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')

package() {
  install -Dm644 $_id.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname-bin"
}
