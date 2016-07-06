# Maintainer: dreieck

_pkgname=idos-package-updater-script
pkgname="${_pkgname}"
epoch=0
pkgver=20160706
pkgrel=2
pkgdesc="Bash script which automates the process of updating installed IDOS timetable browser related packages by reinstalling and thus fetching the newest version."
arch=('any')
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
  "yaourt"
)

makedepends=()

optdepends=()

provides=()

conflicts=()

replaces=()


source=(
  "idos-packages-update.sh"
  "copying.txt"
)

sha256sums=(
  "c7b82eb0e686a20ffe51dc3544f2fe4c3d8f892c714ac3a7b5c7dcc7376140d2"
  "c3cbff25307e905545788f5c74cc137d79706c60549092f2a37919b93cf55ee3"
)


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  _licdirbase="/usr/share/licenses/${pkgname}"
  _licdir="${pkgdir}/${_licdirbase}"
  _execdirbase='/usr/bin'
  _execdir="${pkgdir}/${_execdirbase}"
  
  install -v -D -m755 "${srcdir}/idos-packages-update.sh" "${_instdir}/idos-packages-update.sh"
  install -v -D -m644 "${srcdir}/copying.txt" "${_licdir}/copying.txt"
  install -v -d -m755 "${_execdir}"

  ln -sv "${_instdirbase}/idos-packages-update.sh" "${_execdir}/"
}
