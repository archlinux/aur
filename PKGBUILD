# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Apkawa <apkawa@gmail.com>

# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=django-openid-auth
pkgver=0.13
pkgrel=1
pkgdesc="OpenID integration for django.contrib.auth."
arch=(any)
url="https://launchpad.net/django-openid-auth"
license=(BSD)
depends=('python2' 'python2-openid')
makedepends=('python2-setuptools')
source=("http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('b80677349c5c0cf1f1106398ea8ff102')

package () {

    # django-openid-auth tarball extracts important items to the
    # cwd (in this case $srcdir); this is slightly annoying and
    # broke the package originally.

    cd "${pkgname}-${pkgver}/"
    python2 "setup.py" install --root="${pkgdir}/" --optimize=1

    install -Dm0644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
