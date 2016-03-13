# Maintainer: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=cozy-standalone
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="A personal cloud you can hack, host and delete, packaged without any reverse proxy solution."
arch=('any')
url="https://cozy.io/"
license=('GPL3')
groups=()
depends=('ca-certificates' 'couchdb' 'supervisor' 'bash' 'curl' 'git' 'imagemagick'
    'openssl' 'libxml2' 'libxslt' 'python2' 'python2-setuptools' 'python2-virtualenv' 'sqlite'
    'nodejs-lts-bin' 'pwgen' 'pngcrush' 'lsof' 'cozy-management')
makedepends=()
checkdepends=()
optdepends=('libjpeg-turbo: Needed for the Kresus app'
            'libyaml: Needed for the Kresus app')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("https://raw.githubusercontent.com/cozy/cozy-debian/master/supervisor-cozy-controller",
        "configure-cozy-domain"
        "cozy-rm-db")
noextract=()
md5sums=("SKIP",
         "b26d9d750a3e4b5ba2f693ff8ef23bb5",
         "724ea5f320279d5447c23fe2cf87e238")

build() {
    msg "Thanks for using Cozy. This package is still being tested, if you encounter any difficulty with it, please head over the AUR comments, the Cozy forums or https://github.com/babolivier/cozy-archlinux/issues to give your feedback."
}

package() {
    [ ! -d /usr/share/cozy ] && install -d $pkgdir/usr/share/cozy
    [ ! -d /etc/cozy ] && install -d $pkgdir/etc/cozy

    cp supervisor-cozy-controller $pkgdir/usr/share/cozy
    install -d /usr/bin
    cp configure-cozy-domain $pkgdir/usr/bin/
}
