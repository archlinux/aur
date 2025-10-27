# Maintainer: Dmitriy Q <dmkrotesk-at-mail-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=6.3.0.0
pkgrel=2
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_dd07980aee654032ab5c80d725&tab=releaseNotes"
depends=('bash' 'libxcrypt-compat' 'python' 'python-urllib3' 'python-pyaes' 'python-colorama' 'python-jsonpointer' 'python-six' 'python-ply'
         'python-decorator' 'python-jsonpatch' 'python-jsonpath-rw' 'python-setproctitle' 'python-jsondiff' 'python-tabulate' 
         'python-prompt_toolkit' 'python-certifi' 'python-wcwidth' 'python-ilorest-library')
makedepends=('python-pip')
conflicts=('ilorest-bin')
provides=('ilorest')
groups=(hpproliant)
license=("DMTF")
source=("https://github.com/HewlettPackard/python-redfish-utility/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2192b412083cc7b3e7a450e5d923f1f60bf03b6e535099de5394ada822e59d49')
changelog=ChangeLog

package() {
#    cd "$srcdir/python-redfish-utility-$pkgver"
    cd "$srcdir/python-redfish-utility-master"
    python setup.py install --root="$pkgdir/" --optimize=1
}
