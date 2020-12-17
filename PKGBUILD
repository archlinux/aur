# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=asn-git
_reponame=asn
pkgver=r70.aa88c68
pkgrel=1
pkgdesc='ASN/IPv4/IPv6/Prefix/ASPath lookup tool'
arch=('any')
url="https://github.com/nitefood/asn"
license=('MIT')
depends=('bash' 'mtr' 'whois' 'bind-tools' 'ipcalc' 'grepcidr' 'jq' 'curl' 'aha' 'nmap')
conflicts=('asn')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_reponame
  install -Dm755 $_reponame "$pkgdir"/usr/bin/$_reponame
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
