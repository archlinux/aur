# Maintainer: András Wacha <awacha aT gMaIl>
pkgname=monitoring-plugins-gpu
pkgver=2.3
pkgrel=1
pkgdesc="Monitoring plugins for Nagios, Icinga etc. for OpenAFS servers"
arch=('any')
url="https://www.thomas-krenn.com/en/wiki/GPU_Sensor_Monitoring_Plugin"
license=('GPL')
depends=('perl' 'monitoring-plugins' 'perl-nvidia-ml-pl')
makedepends=()
checkdepends=()
source=("https://github.com/thomas-krenn/check_gpu_sensor_v1/archive/v${pkgver}.tar.gz")
sha256sums=('e9996d438b2f71a4c4364a31a7311d6f8e2cb21b055f79bed8906031a7b2c060')

package() {
    mkdir -p ${pkgdir}/usr/lib/monitoring-plugins/
    mkdir -p ${pkgdir}/usr/share/man/man1/
    install --mode=755 check_gpu_sensor_v1-${pkgver}/check_gpu_sensor ${pkgdir}/usr/lib/monitoring-plugins/
    gzip -c check_gpu_sensor_v1-${pkgver}/doc/check_gpu_sensor.1 > ${pkgdir}/usr/share/man/man1/check_gpu_sensor.1.gz
}
