# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-2019-complete-charmm36
pkgver=201903
_gromacs_ver=2019.6
pkgrel=2
pkgdesc='CHARMM36 force field in GROMACS format.'
url='http://mackerell.umaryland.edu/charmm_ff.shtml#gromacs'
license=("GPL")
arch=('any')
depends=("gromacs-2019-complete=${_gromacs_ver}")
source=(http://mackerell.umaryland.edu/download.php?filename=CHARMM_ff_params_files/charmm36-mar2019.ff.tgz)
sha256sums=('93659165386d7b9eaf5888b3aad1f672e711409545433bae9a3dc6e82cfa72c6')


package() {
  msg2 "Installing charmm36 forcefield files in Gromacs"
  mkdir -p ${pkgdir}/usr/local/gromacs/gromacs-${_gromacs_ver}/share/gromacs/top/charmm36.ff
  cp  ${srcdir}/charmm36-*/* ${pkgdir}/usr/local/gromacs/gromacs-${_gromacs_ver}/share/gromacs/top/charmm36.ff/
  chmod 644 ${pkgdir}/usr/local/gromacs/gromacs-${_gromacs_ver}/share/gromacs/top/charmm36.ff/*
}
