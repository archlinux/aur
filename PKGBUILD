# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=gitsync
pkgver=0.0.3
pkgrel=1
pkgdesc="GitSyncMaster: Automate updating multiple Git repositories within a directory structure effortlessly."
arch=('x86_64')
url="https://github.com/felipealfonsog/GitSyncMaster"
license=('BSD 3-Clause')
depends=('python')

source=("https://github.com/felipealfonsog/GitSyncMaster/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('ee7524b586ad7d66ce9b116f7d65f59310328c1a42ef01ae98739063b1d6c2e0')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Instalar el script Python
  install -Dm755 "$srcdir"/GitSyncMaster-v."${pkgver}"/src/aur-dev/git_updater.py "${pkgdir}/usr/local/bin/gitsync.py"
  
  # Crear un script shell para ejecutar upd8all.py y copiarlo a /usr/local/bin
  echo '#!/bin/bash' > upd8all
  echo 'python /usr/local/bin/gitsync.py "$@"' >> gitsync
  chmod +x gitsync
  install -Dm755 upd8all "${pkgdir}/usr/local/bin/gitsync"
}

