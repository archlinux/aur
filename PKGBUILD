# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Apkawa <apkawa@gmail.com>

# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=django-openid-auth
pkgver=0.5
pkgrel=1
pkgdesc="OpenID integration for django.contrib.auth."
arch=(any)
url="https://launchpad.net/django-openid-auth"
license=(BSD)
depends=('python2' 'python2-openid')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/d/django-openid-auth/django-openid-auth-${pkgver}.tar.gz")
md5sums=(
    '75277ad166be391fbc4ca87666bf64d1'
)

package () {

    # django-openid-auth tarball extracts important items to the
    # cwd (in this case $srcdir); this is slightly annoying and
    # broke the package originally.

    cd "${pkgname}-${pkgver}/"
    python2 "setup.py" install --root="${pkgdir}/" --optimize=1

    install -Dm0644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
