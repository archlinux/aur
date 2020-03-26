pkgname=jami-ubuntu-latest
pkgver=20200318.1.f44e7d0
pkgrel=1
pkgdesc='Free and universal communication platform which preserves the users` privacy and freedoms'
arch=('x86_64')
url='https://jami.net'
license=('GPL3')
depends=('libayatana-appindicator-gtk3' 'jami-daemon' 'clutter' 'clutter-gtk' 'dconf' 
 'desktop-file-utils' 'gtk-update-icon-cache' 'gtk3' 'libcanberra' 'libnm'
 'libnotify' 'qrencode' 'qt5-base' 'webkit2gtk')
conflicts=('jami-gnome' 'libjamiclient')
makedepends=('binutils' 'tar' 'xz' 'patchelf')
source=('https://dl.jami.net/ring-manual/ubuntu_19.10/jami-all_amd64.deb')
provides=('jami-gnome' 'libjamiclient')
sha1sums=('SKIP')
options=(!strip)

build() {
	ar x jami-all_amd64.deb
	tar xf data.tar.xz

	# patchelf is really unstable
	# some libs require hacks like this
	#patchelf --replace-needed libupnp.so.13 libupnp.so usr/lib/ring/dring
	#patchelf --replace-needed libixml.so.10 libixml.so usr/lib/ring/dring
	#patchelf --replace-needed libnettle.so.6 libnettle.so usr/lib/ring/dring
	#patchelf --replace-needed libhogweed.so.4 libhogweed.so usr/lib/ring/dring
	#patchelf --replace-needed libjsoncpp.so.1 libjsoncpp.so usr/lib/ring/dring
}

package() {
	# the files that are commented out are shared with 'jami-daemon'
	install -Dm755 usr/bin/jami ${pkgdir}/usr/bin/jami
	install -Dm755 usr/bin/jami-gnome ${pkgdir}/usr/bin/jami-gnome
	install -Dm644 usr/lib/libringclient.so.1.0.0 ${pkgdir}/usr/lib/libringclient.so.1.0.0
	#install -Dm755 usr/lib/ring/dring ${pkgdir}/usr/lib/ring/dring
	install -Dm644 usr/share/applications/jami-gnome.desktop ${pkgdir}/usr/share/applications/jami-gnome.desktop
	#install -Dm644 usr/share/dbus-1/interfaces/cx.ring.Ring.CallManager.xml ${pkgdir}/usr/share/dbus-1/interfaces/cx.ring.Ring.CallManager.xml
	#install -Dm644 usr/share/dbus-1/interfaces/cx.ring.Ring.ConfigurationManager.xml ${pkgdir}/usr/share/dbus-1/interfaces/cx.ring.Ring.ConfigurationManager.xml
	#install -Dm644 usr/share/dbus-1/interfaces/cx.ring.Ring.Instance.xml ${pkgdir}/usr/share/dbus-1/interfaces/cx.ring.Ring.Instance.xml
	#install -Dm644 usr/share/dbus-1/interfaces/cx.ring.Ring.PresenceManager.xml ${pkgdir}/usr/share/dbus-1/interfaces/cx.ring.Ring.PresenceManager.xml
	#install -Dm644 usr/share/dbus-1/interfaces/cx.ring.Ring.VideoManager.xml ${pkgdir}/usr/share/dbus-1/interfaces/cx.ring.Ring.VideoManager.xml
	#install -Dm644 usr/share/dbus-1/services/cx.ring.Ring.service ${pkgdir}/usr/share/dbus-1/services/cx.ring.Ring.service
	install -Dm644 usr/share/doc/jami-all/README.Debian ${pkgdir}/usr/share/doc/jami-all/README.Debian
	install -Dm644 usr/share/doc/jami-all/changelog.Debian.gz ${pkgdir}/usr/share/doc/jami-all/changelog.Debian.gz
	install -Dm644 usr/share/doc/jami-all/copyright ${pkgdir}/usr/share/doc/jami-all/copyright
	install -Dm644 usr/share/glib-2.0/schemas/net.jami.Jami.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas/net.jami.Jami.gschema.xml
	install -Dm644 usr/share/icons/hicolor/scalable/apps/jami.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/jami.svg
	install -Dm644 usr/share/jami-gnome/jami-gnome.desktop ${pkgdir}/usr/share/jami-gnome/jami-gnome.desktop
	install -Dm644 usr/share/libringclient/translations/lrc_ar.qm ${pkgdir}/usr/share/libringclient/translations/lrc_ar.qm
	install -Dm644 usr/share/libringclient/translations/lrc_bg.qm ${pkgdir}/usr/share/libringclient/translations/lrc_bg.qm
	install -Dm644 usr/share/libringclient/translations/lrc_ca.qm ${pkgdir}/usr/share/libringclient/translations/lrc_ca.qm
	install -Dm644 usr/share/libringclient/translations/lrc_cs_CZ.qm ${pkgdir}/usr/share/libringclient/translations/lrc_cs_CZ.qm
	install -Dm644 usr/share/libringclient/translations/lrc_da.qm ${pkgdir}/usr/share/libringclient/translations/lrc_da.qm
	install -Dm644 usr/share/libringclient/translations/lrc_da_DK.qm ${pkgdir}/usr/share/libringclient/translations/lrc_da_DK.qm
	install -Dm644 usr/share/libringclient/translations/lrc_de.qm ${pkgdir}/usr/share/libringclient/translations/lrc_de.qm
	install -Dm644 usr/share/libringclient/translations/lrc_de_DE.qm ${pkgdir}/usr/share/libringclient/translations/lrc_de_DE.qm
	install -Dm644 usr/share/libringclient/translations/lrc_el.qm ${pkgdir}/usr/share/libringclient/translations/lrc_el.qm
	install -Dm644 usr/share/libringclient/translations/lrc_en_GB.qm ${pkgdir}/usr/share/libringclient/translations/lrc_en_GB.qm
	install -Dm644 usr/share/libringclient/translations/lrc_eo.qm ${pkgdir}/usr/share/libringclient/translations/lrc_eo.qm
	install -Dm644 usr/share/libringclient/translations/lrc_es.qm ${pkgdir}/usr/share/libringclient/translations/lrc_es.qm
	install -Dm644 usr/share/libringclient/translations/lrc_es_AR.qm ${pkgdir}/usr/share/libringclient/translations/lrc_es_AR.qm
	install -Dm644 usr/share/libringclient/translations/lrc_et_EE.qm ${pkgdir}/usr/share/libringclient/translations/lrc_et_EE.qm
	install -Dm644 usr/share/libringclient/translations/lrc_eu.qm ${pkgdir}/usr/share/libringclient/translations/lrc_eu.qm
	install -Dm644 usr/share/libringclient/translations/lrc_fa_IR.qm ${pkgdir}/usr/share/libringclient/translations/lrc_fa_IR.qm
	install -Dm644 usr/share/libringclient/translations/lrc_fi.qm ${pkgdir}/usr/share/libringclient/translations/lrc_fi.qm
	install -Dm644 usr/share/libringclient/translations/lrc_fr.qm ${pkgdir}/usr/share/libringclient/translations/lrc_fr.qm
	install -Dm644 usr/share/libringclient/translations/lrc_fr_BE.qm ${pkgdir}/usr/share/libringclient/translations/lrc_fr_BE.qm
	install -Dm644 usr/share/libringclient/translations/lrc_fr_CA.qm ${pkgdir}/usr/share/libringclient/translations/lrc_fr_CA.qm
	install -Dm644 usr/share/libringclient/translations/lrc_fr_CH.qm ${pkgdir}/usr/share/libringclient/translations/lrc_fr_CH.qm
	install -Dm644 usr/share/libringclient/translations/lrc_fr_FR.qm ${pkgdir}/usr/share/libringclient/translations/lrc_fr_FR.qm
	install -Dm644 usr/share/libringclient/translations/lrc_he.qm ${pkgdir}/usr/share/libringclient/translations/lrc_he.qm
	install -Dm644 usr/share/libringclient/translations/lrc_hi_IN.qm ${pkgdir}/usr/share/libringclient/translations/lrc_hi_IN.qm
	install -Dm644 usr/share/libringclient/translations/lrc_hr.qm ${pkgdir}/usr/share/libringclient/translations/lrc_hr.qm
	install -Dm644 usr/share/libringclient/translations/lrc_hu.qm ${pkgdir}/usr/share/libringclient/translations/lrc_hu.qm
	install -Dm644 usr/share/libringclient/translations/lrc_id.qm ${pkgdir}/usr/share/libringclient/translations/lrc_id.qm
	install -Dm644 usr/share/libringclient/translations/lrc_it.qm ${pkgdir}/usr/share/libringclient/translations/lrc_it.qm
	install -Dm644 usr/share/libringclient/translations/lrc_it_IT.qm ${pkgdir}/usr/share/libringclient/translations/lrc_it_IT.qm
	install -Dm644 usr/share/libringclient/translations/lrc_ja.qm ${pkgdir}/usr/share/libringclient/translations/lrc_ja.qm
	install -Dm644 usr/share/libringclient/translations/lrc_ko_KR.qm ${pkgdir}/usr/share/libringclient/translations/lrc_ko_KR.qm
	install -Dm644 usr/share/libringclient/translations/lrc_lt.qm ${pkgdir}/usr/share/libringclient/translations/lrc_lt.qm
	install -Dm644 usr/share/libringclient/translations/lrc_ms.qm ${pkgdir}/usr/share/libringclient/translations/lrc_ms.qm
	install -Dm644 usr/share/libringclient/translations/lrc_nb.qm ${pkgdir}/usr/share/libringclient/translations/lrc_nb.qm
	install -Dm644 usr/share/libringclient/translations/lrc_nl.qm ${pkgdir}/usr/share/libringclient/translations/lrc_nl.qm
	install -Dm644 usr/share/libringclient/translations/lrc_nl_BE.qm ${pkgdir}/usr/share/libringclient/translations/lrc_nl_BE.qm
	install -Dm644 usr/share/libringclient/translations/lrc_nl_NL.qm ${pkgdir}/usr/share/libringclient/translations/lrc_nl_NL.qm
	install -Dm644 usr/share/libringclient/translations/lrc_pa.qm ${pkgdir}/usr/share/libringclient/translations/lrc_pa.qm
	install -Dm644 usr/share/libringclient/translations/lrc_pl.qm ${pkgdir}/usr/share/libringclient/translations/lrc_pl.qm
	install -Dm644 usr/share/libringclient/translations/lrc_pl_PL.qm ${pkgdir}/usr/share/libringclient/translations/lrc_pl_PL.qm
	install -Dm644 usr/share/libringclient/translations/lrc_pt.qm ${pkgdir}/usr/share/libringclient/translations/lrc_pt.qm
	install -Dm644 usr/share/libringclient/translations/lrc_pt_BR.qm ${pkgdir}/usr/share/libringclient/translations/lrc_pt_BR.qm
	install -Dm644 usr/share/libringclient/translations/lrc_pt_PT.qm ${pkgdir}/usr/share/libringclient/translations/lrc_pt_PT.qm
	install -Dm644 usr/share/libringclient/translations/lrc_ro.qm ${pkgdir}/usr/share/libringclient/translations/lrc_ro.qm
	install -Dm644 usr/share/libringclient/translations/lrc_ru.qm ${pkgdir}/usr/share/libringclient/translations/lrc_ru.qm
	install -Dm644 usr/share/libringclient/translations/lrc_ru_RU.qm ${pkgdir}/usr/share/libringclient/translations/lrc_ru_RU.qm
	install -Dm644 usr/share/libringclient/translations/lrc_sk_SK.qm ${pkgdir}/usr/share/libringclient/translations/lrc_sk_SK.qm
	install -Dm644 usr/share/libringclient/translations/lrc_sl.qm ${pkgdir}/usr/share/libringclient/translations/lrc_sl.qm
	install -Dm644 usr/share/libringclient/translations/lrc_sq_AL.qm ${pkgdir}/usr/share/libringclient/translations/lrc_sq_AL.qm
	install -Dm644 usr/share/libringclient/translations/lrc_sv.qm ${pkgdir}/usr/share/libringclient/translations/lrc_sv.qm
	install -Dm644 usr/share/libringclient/translations/lrc_tr.qm ${pkgdir}/usr/share/libringclient/translations/lrc_tr.qm
	install -Dm644 usr/share/libringclient/translations/lrc_uk.qm ${pkgdir}/usr/share/libringclient/translations/lrc_uk.qm
	install -Dm644 usr/share/libringclient/translations/lrc_zh.qm ${pkgdir}/usr/share/libringclient/translations/lrc_zh.qm
	install -Dm644 usr/share/libringclient/translations/lrc_zh_CN.qm ${pkgdir}/usr/share/libringclient/translations/lrc_zh_CN.qm
	install -Dm644 usr/share/libringclient/translations/lrc_zh_TW.qm ${pkgdir}/usr/share/libringclient/translations/lrc_zh_TW.qm
	install -Dm644 usr/share/lintian/overrides/jami-all ${pkgdir}/usr/share/lintian/overrides/jami-all
	install -Dm644 usr/share/locale/ar/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/ar/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/bg/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/bg/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/ca/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/ca/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/cs_CZ/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/cs_CZ/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/da/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/da/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/da_DK/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/da_DK/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/de/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/de/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/de_DE/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/de_DE/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/el/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/el/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/en_GB/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/en_GB/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/eo/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/eo/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/es/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/es/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/es_AR/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/es_AR/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/et_EE/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/et_EE/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/eu/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/eu/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/fa_IR/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/fa_IR/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/fi/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/fi/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/fr/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/fr/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/fr_BE/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/fr_BE/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/fr_CA/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/fr_CA/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/fr_CH/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/fr_CH/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/fr_FR/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/fr_FR/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/gl/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/gl/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/he/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/he/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/hi_IN/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/hi_IN/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/hr/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/hr/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/hu/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/hu/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/id/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/id/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/it/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/it/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/it_IT/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/it_IT/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/ja/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/ja/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/ko_KR/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/ko_KR/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/lt/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/lt/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/ms/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/ms/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/nb/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/nb/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/nl/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/nl/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/nl_BE/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/nl_BE/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/nl_NL/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/nl_NL/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/nn/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/nn/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/pa/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/pa/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/pl/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/pl/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/pl_PL/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/pl_PL/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/pt/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/pt/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/pt_BR/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/pt_BR/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/pt_PT/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/pt_PT/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/ro/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/ro/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/ru/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/ru/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/ru_RU/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/ru_RU/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/sk_SK/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/sk_SK/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/sl/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/sl/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/sq_AL/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/sq_AL/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/sv/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/sv/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/tr/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/tr/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/uk/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/uk/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/zh/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/zh/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/zh_CN/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES/jami-client-gnome.mo
	install -Dm644 usr/share/locale/zh_TW/LC_MESSAGES/jami-client-gnome.mo ${pkgdir}/usr/share/locale/zh_TW/LC_MESSAGES/jami-client-gnome.mo
	#install -Dm644 usr/share/man/man1/dring.1.gz ${pkgdir}/usr/share/man/man1/dring.1.gz
	install -Dm644 usr/share/man/man8/jami-gnome.8.gz ${pkgdir}/usr/share/man/man8/jami-gnome.8.gz
	install -Dm644 usr/share/metainfo/jami-gnome.appdata.xml ${pkgdir}/usr/share/metainfo/jami-gnome.appdata.xml
	install -Dm644 usr/share/ring/ringtones/01_AfroNigeria.opus ${pkgdir}/usr/share/ring/ringtones/01_AfroNigeria.opus
	install -Dm644 usr/share/ring/ringtones/02_AfroNigeria.opus ${pkgdir}/usr/share/ring/ringtones/02_AfroNigeria.opus
	install -Dm644 usr/share/ring/ringtones/03_AcousticGuitar.opus ${pkgdir}/usr/share/ring/ringtones/03_AcousticGuitar.opus
	install -Dm644 usr/share/ring/ringtones/04_ElectricGuitar.opus ${pkgdir}/usr/share/ring/ringtones/04_ElectricGuitar.opus
	install -Dm644 usr/share/ring/ringtones/05_AcousticIndia.opus ${pkgdir}/usr/share/ring/ringtones/05_AcousticIndia.opus
	install -Dm644 usr/share/ring/ringtones/06_RingSoft.opus ${pkgdir}/usr/share/ring/ringtones/06_RingSoft.opus
	install -Dm644 usr/share/ring/ringtones/07_RingTribal.opus ${pkgdir}/usr/share/ring/ringtones/07_RingTribal.opus
	install -Dm644 usr/share/ring/ringtones/08_RingFirefly.opus ${pkgdir}/usr/share/ring/ringtones/08_RingFirefly.opus
	install -Dm644 usr/share/ring/ringtones/09_ElectroCloud.opus ${pkgdir}/usr/share/ring/ringtones/09_ElectroCloud.opus
	install -Dm644 usr/share/ring/ringtones/10_UrbanTrap.opus ${pkgdir}/usr/share/ring/ringtones/10_UrbanTrap.opus
	#install -Dm644 usr/share/ring/ringtones/default.opus ${pkgdir}/usr/share/ring/ringtones/default.opus
	install -Dm644 usr/share/sounds/jami-gnome/ringtone_notify.wav $${pkgdir}/usr/share/sounds/jami-gnome/ringtone_notify.wav
}


