# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=6.0.0.0
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_8b4b824586db4353bbfebe795f&tab=releaseNotes"
depends=('bash' 'libxcrypt-compat' 'python' 'python-urllib3'
         'python-pyaes' 'python-colorama' 'python-jsonpointer'
         'python-six' 'python-ply' 'python-decorator'
         'python-jsonpatch' 'python-jsonpath-rw' 'python-setproctitle'
         'python-jsondiff' 'python-tabulate' 'python-prompt_toolkit'
         'python-certifi' 'python-wcwidth')
makedepends=("python-pip" "python-ilorest-library")
conflicts=('ilorest-bin')
provides=('ilorest')
groups=(hpproliant)
license=("HPE")
source=("https://github.com/HewlettPackard/python-redfish-utility/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
#source=("https://github.com/HewlettPackard/python-redfish-utility/archive/refs/heads/master.zip")
sha256sums=('89406688ba606bc98ccd2f09d03439d756d323b558a4665a8ce8e872c5f2dcb9')
changelog=ChangeLog

package() {
#    cd "$srcdir/python-redfish-utility-$pkgver"
    cd "$srcdir/python-redfish-utility-master"
    python setup.py install --root="$pkgdir/" --optimize=1
}
