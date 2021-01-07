# Maintainer: pumpkincheshire <sollyonzou@gmail.com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=github-release-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Command-line app to create and edit releases on GitHub (and upload artifacts) — built from pre-compiled binary."
arch=('x86_64')
url="https://github.com/github-release/github-release"
license=('MIT')
conflicts=('github-release')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/linux-amd64-github-release.bz2"
  "LICENSE::https://raw.githubusercontent.com/github-release/github-release/master/LICENSE")
sha512sums=('4afaf2c9da6dd429c7c661ef04c26771183d583e2eec73a1091b79aa62ca042e21d521f2fef1f30cedbd416cead5c210f6f0135e0616f18be0ee6ac18f230380'
            '9d19258b39b9d1c30e7cce85c4ea38c4b818f7b0189c90f938d25134b65e22ae1cc204fb02324d1df1221b35aae3c687919c1f3d1ebd7cea91533255cb7c6da0')

package() {
  install -Dm755 $srcdir/linux-amd64-github-release "${pkgdir}/usr/bin/github-release"

  install -Dm755 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
