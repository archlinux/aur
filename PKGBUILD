# Maintainer: Sai22 <sagittariusz548@gmail.com>
# Contributor: LinArcx <linarcx@gmail.com>

pkgname='qx-entity-editor'
_pkgname='QxEntityEditor'
pkgver=1.2.6
pkgrel=2
pkgdesc="A graphic editor for QxOrm library."
arch=('x86_64' 'i686')
url="https://www.qxorm.com/qxorm_en/home.html"
license=('GPL-3.0')
# "/mnt/D/Document/WorkSpace/Packages/AUR/qx-entity-editor/QxEntityEditor_1.2.2_linux_64b.tar.gz"
source_x86_64=("https://www.qxorm.com/version/QxEntityEditor/${pkgver}/QxEntityEditor_${pkgver}_linux_64b.tar.gz"
              "QxEntityEditor.png"
              "QxEntityEditor.desktop"
              "QEELauncher.sh"
              )
source_i686=("https://www.qxorm.com/version/QxEntityEditor/${pkgver}/QxEntityEditor_${pkgver}_linux_32b.tar.gz"
            "QxEntityEditor.png"
            "QxEntityEditor.desktop"
            "QEELauncher.sh"
            )
sha256sums_x86_64=('fe26ea154cf0c125a96b34cd0491d646366f0cdb105e9ea7ca395f03d1b2bee0'
                    '869286123d353ac0f7c21d2d387a08dd58075cad1d27c7088dae7ab3967c3a04'
                    '50ed62f00c3b67d29984554bccea2b810bddb516289decb0364ba6e64496d255'
                    '6565e7dc0c4a49e661ae9cae387c3387ff5a20ce79f2f4f1e64ef158c3d638e3'
                  )
sha256sums_i686=('4c087df0e90c549c5c2af00492e7195d236f2b34b4a162afe67f6f58a2a8c0a9'
                  '869286123d353ac0f7c21d2d387a08dd58075cad1d27c7088dae7ab3967c3a04'
                  '50ed62f00c3b67d29984554bccea2b810bddb516289decb0364ba6e64496d255'
                  '6565e7dc0c4a49e661ae9cae387c3387ff5a20ce79f2f4f1e64ef158c3d638e3'
                )

package() {
  cd $srcdir

  _pkg=QxEntityEditor_Linux_64b
  if [ "${CARCH}" = "i686" ]; then
    _pkg=QxEntityEditor_Linux_32b
  fi

  install -d "${pkgdir}/opt/${_pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R
  cp $srcdir/QEELauncher.sh ${pkgdir}/opt/${_pkgname}
  cp $srcdir/${_pkgname}.png ${pkgdir}/opt/${_pkgname}
  cp $srcdir/${_pkgname}.desktop ${pkgdir}/opt/${_pkgname}

  # ln -s /opt/${pkgname}/MyQxEntityEditorLauncher.sh "${pkgdir}"/usr/bin/MyQxEntityEditorLauncher.sh
  install -Dm755 ${srcdir}/QEELauncher.sh ${pkgdir}/usr/bin/QEELauncher.sh
  install -Dm755 ${srcdir}/${_pkgname}.png ${pkgdir}/usr/share/icons/${_pkgname}.png
  install -Dm644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  chmod +x ${pkgdir}/usr/bin/QEELauncher.sh
}
