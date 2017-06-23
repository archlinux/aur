# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=python-btrfs-backup
_name=btrfs-backup
pkgver=0.2.1
pkgrel=2
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
sha512sums=('fda97ef8b091ce3d4ddb4e1d24388b27ef8e17dfe5e0085fd7d112b94060e37f0519bc7123b76d4f7f2bef2a871ca685cc23a81f36265064ffb1f48e886add84')

package () {
	cd "${_name}-${pkgver}"
	python3 setup.py install --optimize=1 --root="${pkgdir}"
}
