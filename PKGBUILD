# Maintainer: Janosch Dobler <janosch.dobler@gmx.de>
pkgname=rebash
pkgver=0.3
pkgrel=1
pkgdesc="bash/shell library/framework"
arch=('x86_64')
url="https://github.com/jandob/rebash"
license=('WTFPL')
depends=('bash' 'sed' 'grep')
makedepends=('git')
source=("git+https://github.com/jandob/rebash.git#tag=$pkgver")
md5sums=('SKIP')

package() {
    mkdir -p "${pkgdir}/usr/lib/rebash"
    install -Dm644 "${srcdir}"/rebash/* "${pkgdir}/usr/lib/rebash/"
    chmod 755 "${pkgdir}"/usr/lib/rebash/doc_test.sh
    ln -s "${pkgdir}"/usr/lib/rebash/doc_test.sh "${pkgdir}/usr/bin/rebash-doc-test"
    ln -s "${pkgdir}"/usr/lib/rebash/documentation.sh "${pkgdir}/usr/bin/rebash-documentation"
}
