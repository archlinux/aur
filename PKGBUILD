# Maintainer: douedd <douglaseddie90@gmail>
pkgname='ioniclab-bin-latest'
pkgver=1
pkgrel=1
pkgdesc='Lab is a desktop app for Mac, Windows, and Linux, that makes it a joy to get started with Ionic.'
url='http://lab.ionic.io/'
arch=('i686' 'x86_64')
license=('MIT')
depends=('nodejs-ionic' 'nodejs-cordova')

if [[ $CARCH == "x86_64" ]]; then
  source=('http://bit.ly/ionic-lab-linux-x64')
else
  source=('http://bit.ly/ionic-lab-linux-ia32')
fi

md5sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/opt/IonicLab/" "${pkgdir}/usr/bin/"
  mv "${srcdir}/"* "${pkgdir}/opt/IonicLab/"

  ln -s "/opt/IonicLab/IonicLab" "${pkgdir}/usr/bin/IonicLab"
}

