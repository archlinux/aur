# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=vorta
pkgver=0.5.4
pkgrel=2
pkgdesc="A GUI for BorgBackup"
arch=('any')
url="https://github.com/borgbase/vorta"
license=('GPL')
depends=('borg' 'python-appdirs' 'python-apscheduler' 'python-pyqt5' 'python-peewee' 'python-paramiko' 'python-dateutil' 'python-keyring' 'python-sentry_sdk')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.io/packages/source/v/$pkgname/$pkgname-$pkgver.tar.gz"
        "vorta32.png"
        "vorta.desktop")
sha256sums=('378154b31ef1ea5611ac9995e3159a57b0af1a756bfa9e5668a7ca3d339e724e'
            'ff944c741a291f4d38cac97906376e4afa851f54f46d6de00f6fd92c4ad273f9'  
            '6bd09fed495b0173c2fc0bdb42dde417c3ed3f2d4025927afa3826cf1205372d')
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}/${pkgname}32.png" "$pkgdir/usr/share/pixmaps/${pkgname}32.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

}

# vim:set ts=2 sw=2 et:
