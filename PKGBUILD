# Maintainer: Network_Jack <Network_Jack@null.net>

pkgname=disk-image-scripts
pkgver=1.5
pkgrel=2
pkgdesc="Generate virtual machine template images for the cloud, and tools for working on .img files locally for upload."
arch=('any')
url="https://github.com/NetworkJack2/disk-image-scripts"
license=('GPLv3')
depends=('bash' 'qemu-img' 'arch-install-scripts')
optdepends=('debootstrap: For Debian-based images with gen_cloud_template.sh'
	    'debian-archive-keyring: For Debian-based images with gen_cloud_template.sh'
	    'debian-keyring: For Debian-based images with gen_cloud_template.sh'
	    'ubuntu-keyring: For Ubuntu-based images with gen_cloud_template.sh')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/disk-image-scripts/archive/v${pkgver}.tar.gz")
sha256sums=('b65d121c880dc2c584864ca3f5d7518fb143eae7c5a7062230483ca14727cb19')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="usr/" install
}
