# Contributor: Olivier Mehani <olivier.mehani@inria.fr>
# $Id$

pkgname=arch-gdm-theme-list
pkgver=0.1
pkgrel=1
pkgdesc="An Arch Linux Theme for GDM, also with the face browser version"
makedepends=('bash')
depends=('gdm')
source=()

build() {
	mkdir -p $startdir/pkg/opt/gnome/share/gdm/themes/arch/
	cp $startdir/arch.xml $startdir/pkg/opt/gnome/share/gdm/themes/arch/
	cp $startdir/background.png $startdir/pkg/opt/gnome/share/gdm/themes/arch/
	cp $startdir/options.png $startdir/pkg/opt/gnome/share/gdm/themes/arch/
	cp $startdir/help.png $startdir/pkg/opt/gnome/share/gdm/themes/arch/
	cp $startdir/screenshot.jpg $startdir/pkg/opt/gnome/share/gdm/themes/arch/
	cp $startdir/GdmGreeterTheme.desktop $startdir/pkg/opt/gnome/share/gdm/themes/arch/
	cp $startdir/nvidia-arch.png $startdir/pkg/opt/gnome/share/gdm/themes/arch/

	mkdir -p $startdir/pkg/opt/gnome/share/gdm/themes/arch-list
	for FILE in $startdir/pkg/opt/gnome/share/gdm/themes/arch/* ; do 
		BASENAME=${FILE/*\/}
		ln -s /opt/gnome/share/gdm/themes/arch/${BASENAME} $startdir/pkg/opt/gnome/share/gdm/themes/arch-list/${BASENAME}
	done
	rm $startdir/pkg/opt/gnome/share/gdm/themes/arch-list/arch.xml
	rm $startdir/pkg/opt/gnome/share/gdm/themes/arch-list/screenshot.jpg
	rm $startdir/pkg/opt/gnome/share/gdm/themes/arch-list/GdmGreeterTheme.desktop
	cp $startdir/arch-list.xml $startdir/pkg/opt/gnome/share/gdm/themes/arch-list/
	cp $startdir/screenshot-list.jpg $startdir/pkg/opt/gnome/share/gdm/themes/arch-list/
	cp $startdir/GdmGreeterTheme-list.desktop $startdir/pkg/opt/gnome/share/gdm/themes/arch-list/GdmGreeterTheme.desktop
}
