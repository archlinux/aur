# Maintainer: éclairevoyant
# Contributor: Leon Mergen <leon at solatis dot com>
# Contributor: Barfin

_pkgname=treesheets
pkgname="$_pkgname-bin"
pkgver=1.0.2
pkgrel=2
pkgdesc='Free form data organizer'
arch=('x86_64')
url="https://strlen.com/treesheets/"
license=('custom:zlib')
# wxgtk requires ABI 1013
depends=('glibc' 'wxgtk30')
provides=("$_pkgname=$pkgver")
source=("https://mirrors.kernel.org/ubuntu/pool/universe/t/$_pkgname/${_pkgname}_$pkgver-1build1_amd64.deb"
        "$pkgname.LICENSE::https://github.com/aardappel/treesheets/raw/master/ZLIB_LICENSE.txt")
b2sums=('299310ed24ec55a18108a237360b85b82f2b6fdfa16bd1241877f57f9d31feb2f5c291876fda557a797b0972fab970e01ba951dff5817dbe32e44b1d67b2c44d'
        '381291e4f7b59ea4751357f92d1c9c778b99107a645323ea7d3fb5c784138da10316a2702242e6700c0912eb54d37dc75479b1131c9bbb1a110f519e52c420d4')

package() {
	bsdtar xf data.tar.xz -C "$pkgdir"
	install -Dm644 $pkgname.LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
