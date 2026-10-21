# Maintainer: xuanxuan1231 <xuanxuan1231 at helloswx dot top>

pkgname=hmcl-region-patch
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial tool that patches HMCL so that it no longer treats the machine as mainland China"
arch=('any')
url="https://github.com/xuanxuan1231/hmcl-region-patch"
license=('GPL-3.0-or-later')
depends=('java-runtime')
options=('!strip')

# The archive is built and uploaded by the GitHub workflow that runs when a tag is pushed, so
# the package only installs it: everything the tool needs, including the ASM library, is inside.
source=("$pkgname-$pkgver.tar.gz::https://github.com/xuanxuan1231/hmcl-region-patch/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('89c6da7b5727f85b331d89d02e5a4c0edc605a281f25d38676decc9a215d9fd4')

package() {
    install -Dm644 "$srcdir/$pkgname-$pkgver/lib/$pkgname.jar" \
        "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -Dm755 "$srcdir/$pkgname-$pkgver/bin/$pkgname" \
        "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname-$pkgver/licenses/ASM-LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/ASM-LICENSE.txt"
}
