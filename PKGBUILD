# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=rundeck
pkgver=2.6.7
pkgrel=1
pkgdesc="Open source automation service with a web console, command line tools and a WebAPI"
arch=('i686' 'x86_64')
url="http://messengerfordesktop.com/"
license=('APACHE')
depends=('java-environment')
source=("https://github.com/rundeck/rundeck/archive/v${pkgver}.tar.gz"
        'start.sh')
md5sums=('bee9c70580aa85e92ecfeefec6e673fb'
         'a8e31d4a8d91239bdc326118d6b20c02')

build() {  
  cd "${srcdir}/rundeck-${pkgver}"
  sh ./gradlew build
}

package() {
	install -D -m755 "${srcdir}/start.sh"	  "${pkgdir}/usr/bin/rundeck"
  install -D -m755 "${srcdir}/rundeck-${pkgver}/rundeck-launcher/launcher/build/libs/rundeck-launcher-${pkgver}-SNAPSHOT.jar"	  "${pkgdir}/opt/rundeck/rundeck-launcher.jar"
}
