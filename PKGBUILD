# Maintainer: Dmitriy Q <dmkrotesk-at-mail-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=7.1.0.0
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
sha256sums=('0db68a8ef2abe41f7bb72dcb829f15ef42f0a78b3aae5f04891fd1b3e9a21798')
changelog=ChangeLog

package() {
    cd "$srcdir/python-redfish-utility-master"
    python setup.py install --root="$pkgdir/" --optimize=1
}
