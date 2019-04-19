
# Maintainer: rollingpanda0 <rollingpanda0 at gmail dot com>
pkgname=nzb-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A beautiful CLI front-end for Nozbe written in Rust."
arch=('x86_64')
url="https://gitlab.com/reisub0/nzb"
license=('MIT')
source=('LICENSE'
        'nzb.1.gz'
        "$pkgname-$pkgver.zip::https://gitlab.com/reisub0/nzb/-/jobs/artifacts/v${pkgver}/download?job=linux-x86_64")
md5sums=("3c87776c3d12e38215b96b2803959de5"
         "bec051da5f5d55bb14aea83d77956d92"
         "d34921dd0a97895d30862e2a02fcce58")

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/target/release/nzb" "${pkgdir}/usr/bin"

    install -d "${pkgdir}/usr/share/man/man1"
    install -m644 "nzb.1.gz" "${pkgdir}/usr/share/man/man1"
}
