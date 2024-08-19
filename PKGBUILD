# Maintainer: Consler <consler2000@gmail.com>
pkgname=batpu2-vm
pkgver=2.10
pkgrel=1
pkgdesc="A virtual machine/assembler for MattBatwings' redstone CPU"
arch=('x86_64')
url="https://github.com/AdoHTQ/Batpu2-VM"
license=('MIT')
source=("https://github.com/consler/Batpu2-VM/releases/download/AUR/batpu2-vm.tar.gz")
sha256sums=('d9311da4f2a18417c02a6582689744f62559194d201f9961ad7e7ae3d73ad7a9') 

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  
  cp -r "${srcdir}/batpu2-vm/"* "${pkgdir}/opt/${pkgname}/"
  
  chmod +x "${pkgdir}/opt/${pkgname}/Batpu2-VM.x86_64"

  mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  cp "${srcdir}/batpu2-vm/batpu2-vm_icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/batpu2-vm.png"
  
  mkdir -p "${pkgdir}/usr/share/applications"
  echo "[Desktop Entry]
  Name=Batpu2-VM
  Exec=/opt/${pkgname}/Batpu2-VM.x86_64
  Icon=/usr/share/icons/hicolor/256x256/apps/batpu2-vm.png
  Type=Application
  Categories=Development;" > "${pkgdir}/usr/share/applications/batpu2-vm.desktop"
}

