# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=pops-usb-setup
pkgver=0.0.1
pkgrel=1
pkgdesc="Setup a USB drive for the POPS emulator"
arch=('any')
url="https://gitlab.com/tallero/pops-usb-setup"
license=('AGPL3')
depends=('python')
makedepends=('git' 'python-setuptools' 'wget')
source=("git+$url")
md5sums=(SKIP)

package() {
  cd $pkgname/pops_usb_setup/usb
  rm -rf bitbucket
  git clone "https://github.com/AnimMouse/POPS-binaries" bitbucket

  cd archive
  wget "https://archive.org/download/pops-iox/POPSTARTER.ELF"
  wget "https://archive.org/download/pops-iox/POPS_IOX.PAK"

  cd ../../../

  python3 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
