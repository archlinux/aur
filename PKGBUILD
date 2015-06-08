# Contributor:  Artyom Smirnov <smirnoffjr@gmail.com>
pkgname=eclipse-bazaar-plugin
pkgver=1.1.1.210
pkgrel=1
pkgdesc="Bazaar Plugin for Eclipse"
arch=(i686 x86_64)
url="https://launchpad.net/bzr-eclipse"
license=('GPL')
depends=('bzr-xmloutput>=0.8.1' 'eclipse')
replaces=(eclipse-bzr)
conflicts=(eclipse-bzr)
source=(http://verterok.com.ar/bzr-eclipse/archive/update-site-$pkgver.zip)
md5sums=('f70a5246563b7e1d0656098545d04aa5')

build() {
  cd "${srcdir}/update-site/"
 
  for feature in `find features -type f`; do
	install -Dm644 "${feature}" "${pkgdir}/usr/share/eclipse/dropins/eclipse/${feature}"
  done

  for plugin in `find plugins -type f`; do
	install -Dm644 "${plugin}" "${pkgdir}/usr/share/eclipse/dropins/eclipse/${plugin}"
  done
}
