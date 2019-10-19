pkgname=rcsc-localsign
pkgver=20180518.jar1.7.1
#pkgver=20191015
pkgrel=1
pkgdesc="RCSC LocalSign smartcard signing server (for GoSign and Elektroninis.lt)"
arch=(x86_64)
depends=(java-runtime)
source=("rc-localserver-$pkgver.zip::http://downloads.registrucentras.lt/bylos/dokumentai/rcsc/localsign/rc-localserver-install.zip"
        LocalSign.service
        RCSC_RootCA_4f001ba124bdcb8848bebd3f2b62c7c5.pem
        VI_Registru_Centras_RCSC_RootCA_03a3a457b5f0f3864a1163e898ff169c.pem)
sha256sums=('52832e14e510f511558bfce97735ffd48796f863596edd8644796328667453f3'
            '6c45b7017f3c46fe9551b7ed4c69339fa1a15df3eb02d2dd71558f49866fdd4b'
            'c1bd62c20a74c779e4b2d645736663f8d7451dccce9c886f6e7c1bedfeb43128'
            '92f7673db77de2b46b1bf91870dbe9a28defb3f9b939e819af97cb6d30763945')
# TODO: Figure out how to unpack ISSetupStream for the latest version
#source=("http://www.elektroninis.lt/bylos/dokumentai/rcsc/localsign/localsign-install.exe")
#sha256sums=('17915f63108bc3f5279581589ae2616d908c9a28a71125df4ccf3a5884ceddeb')

package() {
  install -Dm644 -t "$pkgdir"/opt/RCSC/LocalSign local-webserver-1.7.1.jar
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system LocalSign.service
  install -Dm644 -t "$pkgdir"/usr/share/ca-certificates/trust-source/anchors *.pem
}

# vim: ts=2:sw=2:et
