# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=bazarr
pkgver=0.6.6.1
pkgrel=1
pkgdesc="Manage and download subtitles for Sonarr and Radarr."
arch=('any')
url="https://github.com/morpheus65535/bazarr"
license=('GPL3')
depends=('python2'
         'python2-apprise'
         'python2-apscheduler'
         'python2-babelfish'
         'python2-bottle'
         'python2-bottle-fdsend'
         'python2-dogpile.cache'
         'python2-gitpython'
         'python2-langdetect'
         'python2-logutils'
         'python2-pillow'
         'python2-py-pretty'
         'python2-pycountry'
         'python2-pytz'
         'python2-requests'
         'python2-tzlocal'
         'python2-urllib3'
         'python2-waitress'
         'python2-webtest')

makedepends=('git')
source=("bazarr-${pkgver}.tar.gz::https://github.com/morpheus65535/bazarr/archive/v${pkgver}.tar.gz"
        'bazarr.service'
        'bazarr.sysusers'
        'bazarr.tmpfiles')

sha256sums=('a2b01e25bba354e000cc86a55247a1ef56494c5b3559dbdd569082e886ae9487'
            'e3c57f1a1d9ddd87d097efe2df5148f10de79c445fe6eee158f64b4335f3e174'
            '92fd48cbd7e5fe3a0388bbe756a52098fc461ef2dc87d9e886452e4f15acdcdc'
            '7f75f2c2634524e90b1dea7649fceceb57949efa9db365cfa9e29e58690def4e')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/bazarr"
  cp -dpr --no-preserve=ownership "${srcdir}/bazarr-${pkgver}/"* "${pkgdir}/usr/lib/bazarr"

  install -D -m 644 "${srcdir}/bazarr.service" "${pkgdir}/usr/lib/systemd/system/bazarr.service"
  install -D -m 644 "${srcdir}/bazarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/bazarr.conf"
  install -D -m 644 "${srcdir}/bazarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bazarr.conf"
}
