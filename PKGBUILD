# Maintainer: Duong Pham <dthpham@gmail.com>
pkgname=butterflow
pkgver=0.1.9
pkgrel=2
pkgdesc="Make slow motion and motion interpolated videos from the command line"
arch=('x86_64')
url="https://github.com/dthpham/butterflow"
license=('custom')
makedepends=('python2-setuptools' 'opencl-headers')
depends=('python2-numpy' 'ffmpeg' 'opencv' 'ocl-icd')
optdepends=('intel-opencl-runtime: Intel processor device support'
            'opencl-nvidia: NVIDIA device support'
            'amdapp-sdk: AMD device suppport')
provides=('butterflow')
conflicts=('butterflow')
install=butterflow.install
source=("http://srv.dthpham.me/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9f62960bb1a58c7fd7b67e7260d32a51e95ef5c7ff9f0811307463c1f1f338cf')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
