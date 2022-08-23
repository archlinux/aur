# Original Maintainer: Paul Stoetzer <n8hm at arrl dot net>
# Current Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=predict
pkgver=2.3.0
pkgrel=1
pkgdesc='Satellite tracking, orbital prediction, open-source software'
arch=('i686' 'x86_64')
url="http://www.qsl.net/kd2bd/predict.html"
license=('GPL')
depends=('ncurses')
makedepends=()
provides=('predict')
conflicts=()
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://www.qsl.net/kd2bd/${pkgname}-${pkgver}.tar.gz")

sha256sums=('f287263ebf512ab06fc8d7379700f5fc086a836d1ad484712983c3d8979386d5')

build() {
    cd ${pkgname}-${pkgver}
}

package() {
    cd ${pkgname}-${pkgver}
	 ./configure
	 mkdir -p ${pkgdir}/opt/predict/
	 cp -r * ${pkgdir}/opt/predict/
	 mkdir -p ${pkgdir}/usr/bin/
	 ln -s /opt/predict/predict ${pkgdir}/usr/bin/predict
	 install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
