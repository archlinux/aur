# Maintainer: Duong Pham <dthpham@gmail.com>
pkgname=butterflow
pkgver=0.2.3
pkgrel=1
pkgdesc="Make slow motion and motion interpolated videos from the command line"
arch=('x86_64')
url="https://github.com/dthpham/butterflow"
license=('custom')
makedepends=('python2-setuptools' 'opencl-headers')
depends=('python2-numpy' 'ffmpeg' 'opencv2' 'ocl-icd')
optdepends=('intel-opencl-runtime: Intel processor device support'
            'opencl-nvidia: NVIDIA device support'
            'amdapp-sdk: AMD device suppport')
provides=('butterflow')
conflicts=('butterflow')
install=butterflow.install
source=("http://srv.dthpham.me/butterflow/releases/${pkgname}-${pkgver}.tar.gz")
sha256sums=('83e3ce52eef57ae2e4f4b3dc98d97ab354621e4a095d9734751bd876c34b755e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
