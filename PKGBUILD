# Maintainer: HelloSWX <i at helloswx dot top>

pkgname=hmcl-region-patch
pkgver=1.0.1
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
sha256sums=('f7207724e3ef44f1ac68256531b2e052a1c080cf4d7b6b681e4f643ff1336b3d')

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
