# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ec2-metadatafs-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Mount AWS EC2 instance metadata as files"
arch=('x86_64' 'aarch64')
url="https://github.com/jszwedko/ec2-metadatafs"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ec2-metadatafs_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ec2-metadatafs_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3c5e5a13f54712422ebdf80f89bfc2a6bcc24e3ccb8a552de33cd1a932d33031')
sha256sums_aarch64=('c2e11ed366d138060336cf1a700a4a94a10a0b775f98ce0fe155e7a628e49acb')

package() {
  install -Dm755 "ec2-metadatafs" "${pkgdir}/usr/bin/ec2-metadatafs"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "ec2-metadatafs.1" -t "${pkgdir}/usr/share/man/man1"
}
