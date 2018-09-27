# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=python-btrfs-backup
_name=${pkgname#python-}
pkgver=0.3.1
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
sha1sums=('baee713913a4e8945101d8f36714b7980e97fb72')

package () {
	cd "${_name}-${pkgver}"
	python3 setup.py install --optimize=1 --root="${pkgdir}"
}
