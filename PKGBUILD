# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=eos_portable_archive
pkgver=5.1
pkgrel=1
pkgdesc="A portable binary archive to be used with boost::serialization"
arch=('any')
url="https://epa.codeplex.com/"
license=('custom')
depends=('boost')
source=("${pkgname}_v${pkgver}.zip::http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=epa&DownloadId=1510504&FileTime=130914061641930000&Build=21031")
md5sums=('d2deb35c23e5b4e4468f00c3d9d2f7b3')

package() {
  cd "$pkgname"
  install -d -m755 "$pkgdir/usr/include/eos"
  install -m644 eos/* "$pkgdir/usr/include/eos/"

  # copy boost license from filesystem
  install -D -m644 /usr/share/licenses/boost/* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
