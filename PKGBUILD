# Maintainer: KOWX712 <leecc0503@gmail.com>
pkgname=dexsql-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="SQL for Android apk and dex files"
arch=('x86_64' 'aarch64')
url="https://dexsql.lsposed.org"
license=('custom')
depends=('glibc')
source=("https://github.com/LSPosed/dexsql-release/releases/download/v0.1.1/LICENSE"
        "https://github.com/LSPosed/dexsql-release/releases/download/v0.1.1/LICENSE-AUXILIARY")
source_x86_64=("https://github.com/LSPosed/dexsql-release/releases/download/v0.1.1/dexsql-linux-amd64")
source_aarch64=("https://github.com/LSPosed/dexsql-release/releases/download/v0.1.1/dexsql-linux-arm64")
sha256sums=('a5e8ba355d3bbc08a1de333b93cfaadff62c1b335454930c3bc8163d710b5a30'
            '91c80095437ed20c2dca7758f63f03e15eedb46aa4854577b5df20c788ecc514')
sha256sums_x86_64=('f35c57610fcee62864e68f12e51997621375c025447aa2f32a0be9eb2df464bc')
sha256sums_aarch64=('8095a4acafbfda3c4d502423f185c28063132b2fb3b11489aba7ee2fe2dcd13f')

package() {
  case "$CARCH" in
    x86_64)  _bin="dexsql-linux-amd64" ;;
    aarch64) _bin="dexsql-linux-arm64" ;;
    *) echo "unsupported arch: $CARCH" >&2; return 1 ;;
  esac
  install -Dm755 "$_bin" "$pkgdir/usr/bin/dexsql"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE-AUXILIARY "$pkgdir/usr/share/licenses/$pkgname/LICENSE-AUXILIARY"
}
