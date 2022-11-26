pkgname=libelectron
pkgver=1.0.1
pkgrel=1
arch=("x86_64" "aarch64")
license=('GPL')
depends=('npm')
pkgdesc="A collection of npm dependencies for electron packages."
_MachineType=`uname -m`

package() {
    if [[ ${_MachineType} == aarch64 ]]; then
      npm i electron@21.3.1 electron-context-menu@3.6.0
      #Ignoring Electron Castlab until it is avaliable
fi
if [[ ${_MachineType} == x86_64 ]]; then
      npm i electron@21.3.1 electron-context-menu@3.6.0
      npm install "https://github.com/castlabs/electron-releases#v20.3.6+wvcus" --save-dev
fi
    install -dm755 "$pkgdir/opt/libelectron"
    cp -r ./node_modules "$pkgdir/opt/libelectron"
}
