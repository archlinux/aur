pkgname=libelectron
pkgver=1.0.3
pkgrel=1
arch=("x86_64" "aarch64")
license=('GPL')
depends=('npm' 'git')
pkgdesc="A collection of npm dependencies for electron packages."
_MachineType=`uname -m`
_electron=22.0.0
_electroncastlabs=v21.3.3+wvcus
_ecm=3.6.1

package() {
    if [[ ${_MachineType} == aarch64 ]]; then
      npm i electron@$_electron electron-context-menu@$_ecm
      #Ignoring Electron Castlab until it is avaliable
fi
if [[ ${_MachineType} == x86_64 ]]; then
      npm i electron@$_electron electron-context-menu@$_ecm
      npm install "https://github.com/castlabs/electron-releases#$_electroncastlabs" --save-dev
fi
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r ./node_modules "$pkgdir/opt/libelectron"
}
