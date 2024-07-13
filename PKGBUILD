# Maintainer: revsuine <paradoor at protonmail dot com>
pkgname=ckb-next-runit
pkgver=1.0.0
pkgrel=1
pkgdesc="Runit service for ckb-next"
arch=("i686" "x86_64" "pentium4")
url="https://codeberg.org/revsuine/${pkgname}"
licence=("GPL-3.0-or-later")
depends=("runit"
    "ckb-next")
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=("55c8efca2bddac983920aabc08651902462b9a0cfca84fb14958483be11ba395")

package() {
    service_dir="/etc/runit/sv"
    echo "Warning: This package assumes that ${service_dir} is where you store runit services. If your service directory is elsewhere, you can easily edit the PKGBUILD to reflect your service directory."

    install_dir="${pkgdir}${service_dir}/ckb-next"
    mkdir -p "${install_dir}"
    install -Dm 744 "${srcdir}/${pkgname}/ckb-next"/* -t "${install_dir}"
}

