pkgname='statsdaemon'
pkgdesc='Port of StatsD to Go, with built-in Graphite support'
license='custom'
pkgver='0.7.1'
pkgrel='1'
makedepends=('go')
depends=('glibc')
arch=('x86_64' 'arm' 'i686')
url='https://github.com/bitly/statsdaemon'
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b7e3eb7832ae15026b812b46db82b29c9304a9a3e1a26f365268bc5f1c436704b3c11146c0110a7f2743679cc123d13d8b60d5c7535e4ee44cca03f93a4efa10')

build () {
	cd "${pkgname}-${pkgver}"
	go build -x -v -o statsdaemon
}

package () {
	cd "${pkgname}-${pkgver}"
	install -Dm644 UNLICENSE \
	               "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
	install -Dm644 README.md \
	               "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm755 statsdaemon \
	               "${pkgdir}/usr/bin/statsdaemon"
}
