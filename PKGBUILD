# Maintainer: Jeremiah Ticket <seashellpromises@gmail.com>
pkgname=('teamtalk-client')
pkgver=5.12
pkgrel=1
        pkgdesc='a software conferencing system client which enables a group of people to collaborate and share information using voice and video'
arch=('x86_64')
        depends=('gcc-libs' 'qt5-base' 'qt5-multimedia' 'qt5-speech' 'qt5-x11extras' 'openssl')
        install="${pkgname}.install"
license=('custom')
url='http://www.bearware.dk'
_dlname='teamtalk'
source=("https://bearware.dk/${_dlname}/v${pkgver}/${_dlname}-v${pkgver}-ubuntu22-${arch}.tgz"
        "${pkgname}.install" "TeamTalk.desktop" "teamtalk")
sha256sums=('98f58979c06a8cbce8007ac1ab2d107d7bf3f557912af036af1cb3e542eb60ee'
            '6a2e562a3eab75d51a7f8c26b892914c3f163575598c7891901cfe78a215d813'
            '7b025ff93113a4b6b957155c56b4c10b62d193d001d3b8ae755e3c830037609e'
            'a7df5f7a6503d7ee32351fda207bcac6996d98f25b027f72aa26a20eb6702fa5')

package() {
  install -Dm644 ${srcdir}/${_dlname}-v${pkgver}-ubuntu22-${arch}/License.txt ${pkgdir}/usr/share/licenses/${_dlname}/LICENSE
  install -dm755 $pkgdir/opt/teamtalk-client/
  install -Dm644 TeamTalk.desktop $pkgdir/usr/share/applications/TeamTalk.desktop
  install -Dm755 teamtalk $pkgdir/usr/bin/teamtalk
cp -r ${srcdir}/${_dlname}-v${pkgver}-ubuntu22-${arch}/client/* $pkgdir/opt/teamtalk-client/
}
