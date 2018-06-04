# Maintainer: Paul Stoetzer <n8hm at arrl dot net>
pkgname=predict
pkgver=2.2.5
pkgrel=2
pkgdesc='Satellite tracking, orbital prediction, open-source software'
arch=('i686' 'x86_64')
url="http://www.qsl.net/kd2bd/predict.html"
license=('GPL')
depends=('ncurses')
makedepends=()
provides=('predict')
conflicts=()
options=('!emptydirs')
source=("https://www.qsl.net/kd2bd/predict-2.2.5.tar.bz2")
md5sums=(b80ed5749688742c32b9b87870a1ed67)

build() {
    cd "predict-2.2.5"
        
}

package() {
    cd "predict-2.2.5"
	 ./configure
	 mkdir -p ${pkgdir}/opt/predict/
	 cp -r * ${pkgdir}/opt/predict/
	 mkdir -p ${pkgdir}/usr/bin/
	 ln -s /opt/predict/predict ${pkgdir}/usr/bin/predict
	 install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
