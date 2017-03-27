# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=eos_portable_archive
pkgver=5.1
pkgrel=2
pkgdesc="A portable binary archive to be used with boost::serialization"
arch=('any')
url="https://epa.codeplex.com/"
license=('custom')
depends=('boost')
source=("${pkgname}_v${pkgver}.zip::http://download-codeplex.sec.s-msft.com/Download/SourceControlFileDownload.ashx?ProjectName=epa&changeSetId=45618")
md5sums=('c38742aab0842a1cc325f118ca5ec7db')

package() {
  install -d -m755 "$pkgdir/usr/include/eos"
  install -m644 eos/* "$pkgdir/usr/include/eos/"

  # copy boost license from filesystem
  install -D -m644 /usr/share/licenses/boost/* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
