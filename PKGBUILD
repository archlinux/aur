# Maintainer: isaacangello <isaacangello@inf.ufpell.edu.br>
# Binários standalone do Bun (~100 MB por arquitetura), publicados no GitHub Releases.
pkgname=nimsync-bin
pkgver=0.3.0
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
source_x86_64=("${_url}/nimsync-${pkgver}-linux-x64")
source_aarch64=("${_url}/nimsync-${pkgver}-linux-arm64")
sha256sums_x86_64=('14b709f85880a8167a8bc3d460bf17e70cf8fb3a2dcfac35ecaf78aa8e2db84d')
sha256sums_aarch64=('7dcf8c37c4b45abba6aeaaa45c2dabf4ef776801bd2f86bb39532c0adad1923d')

case "${CARCH}" in
  x86_64) _bin="nimsync-${pkgver}-linux-x64" ;;
  aarch64) _bin="nimsync-${pkgver}-linux-arm64" ;;
esac

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/nimsync"
  install -Dm644 "${srcdir}/nimsync-LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
