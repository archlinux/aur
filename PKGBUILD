# Maintainer: Florian Wetzel <aur@commanderred.xyz>
pkgname=prometheus-apple-refurbed

pkgver=0.1.0
pkgrel=2
pkgdesc="A simple prometheus scraper written in NodeJS to scrape apples refurbed products"

arch=('any')
url="https://github.com/CommanderRedYT/prometheus-apple-refurbed"
license=('MIT')

depends=('nodejs')
makedepends=('npm')

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/tags/${pkgver}.tar.gz"
)
sha256sums=('784d497b6babbda8f4f7cd80206695569d3053f4bed796688110ce5422e29b22')

package() {
  npm install --global --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz --cache npm-cache

  install -D -m 644 "${srcdir}/${pkgname}-tags-${pkgver}/prometheus-apple-refurbed.service" ${pkgdir}/usr/lib/systemd/system/prometheus-apple-refurbed.service
  install -D -m 644 "${srcdir}/${pkgname}-tags-${pkgver}/prometheus-apple-refurbed.conf" ${pkgdir}/etc/conf.d/prometheus-apple-refurbed.conf
  install -D -m 644 "${srcdir}/${pkgname}-tags-${pkgver}/prometheus-apple-refurbed.sysusers" ${pkgdir}/usr/lib/sysusers.d/prometheus-apple-refurbed.conf
}
