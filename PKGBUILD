# Maintainer: Dmitriy Q <dmkrotesk-at-mail-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=7.2.0.0
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_0b881600776d472b948d163114&tab=releaseNotes"
depends=('bash' 'libxcrypt-compat' 'python' 'python-urllib3' 'python-pyaes' 'python-colorama' 'python-jsonpointer' 'python-six' 'python-ply'
         'python-decorator' 'python-jsonpatch' 'python-jsonpath-rw' 'python-setproctitle' 'python-jsondiff' 'python-tabulate' 
         'python-prompt_toolkit' 'python-certifi' 'python-wcwidth' 'python-ilorest-library')
makedepends=('python-pip')
conflicts=('ilorest-bin')
provides=('ilorest')
groups=(hpproliant)
license=("DMTF")
#source=("https://github.com/HewlettPackard/python-redfish-utility/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
source=("https://github.com/HewlettPackard/python-ilorest-library/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('239c6e4b00f2bacaa28a2b89e2e0c96e921b93e1722bbc242e88fdfce05f2be6')
changelog=ChangeLog

package() {
    cd "$srcdir/python-redfish-utility-master"
    python setup.py install --root="$pkgdir/" --optimize=1
}
