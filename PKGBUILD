# Maintainer:  Paweł Ciechomski <p.ciechomski@icm.edu.pl>

pkgname=pem-heart-signature
pkgver=3.9.13.25
pkgrel=2
pkgdesc='Software for digitally signing and verifying files with CenCert qualified certificate'
arch=(x86_64)
url='https://www.cencert.pl/do-pobrania/oprogramowanie-do-podpisu/'
license=(proprietary)
depends=(ncurses5-compat-libs ccid opensc)
source=(https://www.cencert.pl/wp-content/software/PH-$pkgver.tgz)
sha256sums=('52c22ab0d8ac5336aec5ad088ac9b589e74055a0a563041187472a52ec2658a8')

package() {
		install -d "$pkgdir"/opt/pemheart_signer/{bin,data,db,doc,etc,lib}
		install -d "$pkgdir"/opt/pemheart_signer/data/{file-manager,gconf,images,menu,mime}
		install -d "$pkgdir"/opt/pemheart_signer/db/tsl
		install -d "$pkgdir"/opt/pemheart_signer/lib/{pkcs11,platforms}
		cp -a opt/pemheart_signer/* "$pkgdir"/opt/pemheart_signer/

		install -d "$pkgdir"/usr/share/applications/
		cp -a usr/share/applications/* "$pkgdir"/usr/share/applications/
		install -d "$pkgdir"/etc/pemheart_signer/db/tsl
		cp -a etc/pemheart_signer/* "$pkgdir"/etc/pemheart_signer/


		install -d "$pkgdir"/usr/bin/
		ln -s /opt/pemheart_signer/bin/pemheart_runner.sh "$pkgdir"/usr/bin/pemheart_signer
		ln -s /opt/pemheart_signer/bin/pemheart_runner.sh "$pkgdir"/usr/bin/pemheart_activator
		ln -s /opt/pemheart_signer/bin/pemheart_runner.sh "$pkgdir"/usr/bin/pemheart_recert
		ln -s /opt/pemheart_signer/bin/pemheart_runner.sh "$pkgdir"/usr/bin/pemheart_configurator
		ln -s /opt/pemheart_signer/etc/pemsigner.conf "$pkgdir"/etc/pemheart_signer/pemsigner.conf
		ln -s /opt/pemheart_signer/etc/pemsignerprofiles.conf "$pkgdir"/etc/pemheart_signer/pemsignerprofiles.conf
		chmod 755 -R $pkgdir/opt/pemheart_signer/
		chmod 755 -R $pkgdir/etc/pemheart_signer/


 


}
