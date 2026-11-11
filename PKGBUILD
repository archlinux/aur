# Maintainer: isaacangello <isaacangello@inf.ufpell.edu.br>
# Binários standalone do Bun (~100 MB por arquitetura), publicados no GitHub Releases.
pkgname=nimsync-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Sync the NVIDIA NIM catalog (build.nvidia.com) with the OpenCode model whitelist"
arch=('x86_64' 'aarch64')
url="https://github.com/isaacangello/nimsync"
license=('MIT')
depends=('glibc')
provides=('nimsync')
conflicts=('nimsync')
_url="https://github.com/isaacangello/nimsync/releases/download/v${pkgver}"
source=("nimsync-LICENSE-${pkgver}::https://raw.githubusercontent.com/isaacangello/nimsync/v${pkgver}/LICENSE")
sha256sums=('75cdde8fdba948258a170beb8095fac4a0967a04e213d51a58eaafdd78c3f9ac')
source_x86_64=("${_url}/nimsync-linux-x64")
source_aarch64=("${_url}/nimsync-linux-arm64")
sha256sums_x86_64=('d41a810ce50b134505b90278c020f91e7390d7ec5020f168ce59d025881417ec')
sha256sums_aarch64=('659befde01bf43617e13f4239f2b096d4f792ea82f4253c810cee6255cf62e7e')

case "${CARCH}" in
  x86_64) _bin="nimsync-linux-x64" ;;
  aarch64) _bin="nimsync-linux-arm64" ;;
esac

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/nimsync"
  install -Dm644 "${srcdir}/nimsync-LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
