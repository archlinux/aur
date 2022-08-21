# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=disk-image-scripts
pkgver=1.4
pkgrel=2
pkgdesc="Generate virtual machine template images for the cloud, and tools for working on .img files locally for upload."
arch=('any')
url="https://github.com/GIJack/disk-image-scripts"
license=('GPLv3')
depends=('bash' 'qemu-img' 'arch-install-scripts')
optdepends=('debootstrap: For Debian-based images with gen_cloud_template.sh'
	    'debian-archive-keyring: For Debian-based images with gen_cloud_template.sh'
	    'ubuntu-keyring: For Ubuntu-based images with gen_cloud_template')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/disk-image-scripts/archive/v${pkgver}.tar.gz")
sha256sums=('c4b35ccf82b6cd3dff3701b7a8263c72a763b702bd614fe365fead5aad58aeff')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX="usr/" install
}
