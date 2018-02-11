# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=python-btrfs-backup
_name=btrfs-backup
pkgver=0.3.0
pkgrel=1
pkgdesc="incremental atomic backups for btrfs using snapshots with local and/or remote storage."
arch=('any')
url="https://github.com/efficiosoft/btrfs-backup"
license=('MIT')
depends=('python>=3.3' 'linux>=3.12' 'btrfs-progs>=3.12')
makedepends=('python-setuptools')
optdepends=('pv: displaying progress during backups'
            'openssh: remote backup storage')
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://github.com/efficiosoft/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('49d32569a3f7767cb6a6b69cf69bb0518a2c41c775a71d43ebf06ff3ae84a1791663182a6bb81aae3daceebc1af0b1eb6661ec272aad219aeb83edf0550f86be')

package () {
	cd "${_name}-${pkgver}"
	python3 setup.py install --optimize=1 --root="${pkgdir}"
}
